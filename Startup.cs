using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DRG_Api.Authentication;
using DRG_Api.Contexts;
using DRG_Api.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;

namespace DRG_Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            string mySqlConnectionStr =
                Configuration.GetConnectionString("DefaultConnection");
            services
                .AddDbContext<PlayedGamesContext>(options =>
                    options
                        .UseMySql(mySqlConnectionStr,
                        ServerVersion.AutoDetect(mySqlConnectionStr)));

            services.AddControllers();
            services
                .AddSwaggerGen(c =>
                {
                    c
                        .SwaggerDoc("v1",
                        new OpenApiInfo { Title = "DRG_Api", Version = "v1" });
                });

            services
                .AddCors(options =>
                {
                    options
                        .AddDefaultPolicy(builder =>
                        {
                            builder
                                .WithOrigins("http://localhost")
                                .AllowAnyHeader()
                                .AllowAnyMethod()
                                .AllowAnyOrigin();
                        });
                });
            services.AddTransient<IUnitOfWork, UnitOfWork>();

            var key = "Secret key Dr96101709565";

            services
                .AddAuthentication(auth =>
                {
                    auth.DefaultAuthenticateScheme =
                        JwtBearerDefaults.AuthenticationScheme;
                    auth.DefaultChallengeScheme =
                        JwtBearerDefaults.AuthenticationScheme;
                })
                .AddJwtBearer(jwt =>
                {
                    jwt.RequireHttpsMetadata = false;
                    jwt.SaveToken = true;
                    jwt.TokenValidationParameters =
                        new Microsoft.IdentityModel.Tokens.TokenValidationParameters {
                            ValidateIssuerSigningKey = true,
                            ValidateIssuer = false,
                            ValidateAudience = false,
                            IssuerSigningKey =
                                new SymmetricSecurityKey(Encoding
                                        .ASCII
                                        .GetBytes(key))
                        };
                });
            services.AddSingleton<IJwtAuth>(new Auth(key));
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app
                    .UseSwaggerUI(c =>
                        c
                            .SwaggerEndpoint("/swagger/v1/swagger.json",
                            "DRG_Api v1"));
            }

            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();
            app.UseCors();

            app
                .UseEndpoints(endpoints =>
                {
                    endpoints.MapControllers();
                });
        }
    }
}
