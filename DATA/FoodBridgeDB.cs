using FoodBridge.Models;
using Microsoft.EntityFrameworkCore;

namespace FoodBridge.DATA;

public class FoodBridgeDB:DbContext
{
    public FoodBridgeDB(DbContextOptions<FoodBridgeDB> options) : base(options)
    {
        
    }

    public DbSet<User> Users
    {
        get { return Set<User>(); }
       
    }
    public DbSet<Food> Foods
    {
        get { return Set<Food>(); }
    }
    public DbSet<NeededFood> NeededFoods
    {
        get { return Set<NeededFood>(); }
    }
    public DbSet<MatchedFood> MatchedFoods
    {
        get { return Set<MatchedFood>(); }
    }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        modelBuilder.Entity<User>().HasIndex(u => u.EmailID).IsUnique();
        modelBuilder.Entity<Food>().HasOne(f=>f.user).WithMany().HasForeignKey(f=>f.emailID);
        modelBuilder.Entity<NeededFood>().HasOne(f=>f.user).WithMany().HasForeignKey(f=>f.emailID);
    }
}