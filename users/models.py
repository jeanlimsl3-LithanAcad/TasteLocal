from django.db import models


# Stores vendor and food experience information for the TasteLocal platform
class Vendor(models.Model):
    vendor_name = models.CharField(max_length=200)
    experience_title = models.CharField(max_length=200)
    category = models.CharField(max_length=100)
    description = models.TextField()
    location = models.CharField(max_length=200)
    region = models.CharField(max_length=50)
    price_range = models.CharField(max_length=50)
    rating = models.DecimalField(max_digits=2, decimal_places=1, default=0.0)
    image = models.CharField(max_length=200, blank=True, null=True)
    map_embed_url = models.URLField(blank=True, null=True)
    map_link = models.URLField(blank=True, null=True)

    def __str__(self):
        return f"{self.experience_title} - {self.vendor_name}"


# Stores booking records for selected food experiences
class Booking(models.Model):
    vendor = models.ForeignKey(Vendor, on_delete=models.CASCADE)
    customer_name = models.CharField(max_length=200)
    customer_email = models.EmailField()
    booking_date = models.DateField()
    number_of_guests = models.PositiveIntegerField()
    special_requests = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Booking for {self.vendor.experience_title} by {self.customer_name}"


# Stores customer ratings and reviews for food experiences
class Review(models.Model):
    vendor = models.ForeignKey(Vendor, on_delete=models.CASCADE)
    reviewer_name = models.CharField(max_length=200)
    rating = models.DecimalField(max_digits=2, decimal_places=1)
    comment = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Review for {self.vendor.experience_title} by {self.reviewer_name}"


# Stores itinerary items saved by users for planning
class Itinerary(models.Model):
    vendor = models.ForeignKey(Vendor, on_delete=models.CASCADE)
    planned_date = models.DateField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    status = models.CharField(max_length=50, default="Planned")
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Itinerary: {self.vendor.experience_title}"