namespace DRG_Api.Authentication
{
    public interface IJwtAuth
    {
        string Authentication(string username, string password);
    }
}
