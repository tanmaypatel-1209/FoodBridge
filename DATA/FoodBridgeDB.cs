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
    public DbSet<FoodDelivery> FoodDeliveries
    {
        get { return Set<FoodDelivery>(); }
    }
    public DbSet<DeliveryStatusHistory> DeliveryStatusHistories
    {
        get { return Set<DeliveryStatusHistory>(); }
    }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        modelBuilder.Entity<User>().HasIndex(u => u.EmailID).IsUnique();
        modelBuilder.Entity<Food>().HasOne(f=>f.user).WithMany().HasForeignKey(f=>f.emailID);
        modelBuilder.Entity<NeededFood>().HasOne(f=>f.user).WithMany().HasForeignKey(f=>f.emailID);

        modelBuilder.Entity<FoodDelivery>()
            .HasOne(d => d.MatchedFood)
            .WithMany()
            .HasForeignKey(d => d.MatchedFoodId)
            .OnDelete(DeleteBehavior.Cascade);

        modelBuilder.Entity<FoodDelivery>()
            .HasOne(d => d.Donor)
            .WithMany()
            .HasForeignKey(d => d.DonorId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<FoodDelivery>()
            .HasOne(d => d.Receiver)
            .WithMany()
            .HasForeignKey(d => d.ReceiverId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<FoodDelivery>()
            .HasOne(d => d.Transporter)
            .WithMany()
            .HasForeignKey(d => d.TransporterId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<DeliveryStatusHistory>()
            .HasOne(h => h.Delivery)
            .WithMany()
            .HasForeignKey(h => h.DeliveryId)
            .OnDelete(DeleteBehavior.Cascade);
    }
}