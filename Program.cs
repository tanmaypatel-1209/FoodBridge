using System.Text;
using FoodBridge.DATA;
using FoodBridge.services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;

namespace FoodBridge;

public class Program
{
    public static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        // Add services to the container.
        builder.Services.AddSingleton<JWTCreate>();
        builder.Services.AddControllersWithViews();
        builder.Services
            .AddAuthentication(
                JwtBearerDefaults.AuthenticationScheme
            )
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters =
                    new TokenValidationParameters
                    {
                        ValidateIssuer = true,

                        ValidateAudience = true,

                        ValidateLifetime = true,

                        ValidateIssuerSigningKey = true,

                        ValidIssuer =
                            builder.Configuration["Jwt:Issuer"],

                        ValidAudience =
                            builder.Configuration["Jwt:Audience"],

                        IssuerSigningKey =
                            new SymmetricSecurityKey(
                                Encoding.UTF8.GetBytes(
                                    builder.Configuration["Jwt:Key"]!
                                )
                            ),

                        ClockSkew = TimeSpan.Zero
                    };
            });
        string URL = "Server=localhost;Port=3306;Database=foodbridgedb;User=root;Password=Tanmay@1907";
        builder.Services.AddDbContext<FoodBridgeDB>(options => options.UseMySql(URL, ServerVersion.AutoDetect(URL)));
        var app = builder.Build();

        // Configure the HTTP request pipeline.
        if (!app.Environment.IsDevelopment())
        {
            app.UseExceptionHandler("/Home/Error");
            // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
            app.UseHsts();
        }

        app.UseHttpsRedirection();
        app.UseRouting();
        app.UseAuthentication();
        app.UseAuthorization();

        app.MapStaticAssets();
        app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}")
            .WithStaticAssets();

        app.Run();
    }
}