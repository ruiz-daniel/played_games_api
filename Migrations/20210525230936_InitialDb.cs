using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

namespace DRG_Api.Migrations
{
    public partial class InitialDb : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "platform",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    name = table.Column<string>(type: "longtext CHARACTER SET utf8mb4", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_platform", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "status",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    name = table.Column<string>(type: "longtext CHARACTER SET utf8mb4", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_status", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "playedgame",
                columns: table => new
                {
                    id = table.Column<string>(type: "varchar(255) CHARACTER SET utf8mb4", nullable: false),
                    name = table.Column<string>(type: "longtext CHARACTER SET utf8mb4", nullable: true),
                    year = table.Column<string>(type: "longtext CHARACTER SET utf8mb4", nullable: true),
                    developer = table.Column<string>(type: "longtext CHARACTER SET utf8mb4", nullable: true),
                    publisher = table.Column<string>(type: "longtext CHARACTER SET utf8mb4", nullable: true),
                    genre = table.Column<string>(type: "longtext CHARACTER SET utf8mb4", nullable: true),
                    rating = table.Column<int>(type: "int", nullable: false),
                    platformid = table.Column<int>(type: "int", nullable: false),
                    statusid = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_playedgame", x => x.id);
                    table.ForeignKey(
                        name: "FK_playedgame_platform_platformid",
                        column: x => x.platformid,
                        principalTable: "platform",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_playedgame_status_statusid",
                        column: x => x.statusid,
                        principalTable: "status",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_playedgame_platformid",
                table: "playedgame",
                column: "platformid");

            migrationBuilder.CreateIndex(
                name: "IX_playedgame_statusid",
                table: "playedgame",
                column: "statusid");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "playedgame");

            migrationBuilder.DropTable(
                name: "platform");

            migrationBuilder.DropTable(
                name: "status");
        }
    }
}
