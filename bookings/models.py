from django.db import models
from django.contrib.auth import get_user_model
from experiences.models import Experience

User = get_user_model()


class Booking(models.Model):
    """Represents a user booking for an experience."""

    STATUS_CHOICES = [
        ('pending', 'Pending'),
        ('confirmed', 'Confirmed'),
        ('cancelled', 'Cancelled'),
    ]

    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='bookings'
    )

    experience = models.ForeignKey(
        Experience,
        on_delete=models.CASCADE,
        related_name='bookings'
    )

    number_of_guests = models.PositiveIntegerField()

    booking_date = models.DateField()

    status = models.CharField(
        max_length=20,
        choices=STATUS_CHOICES,
        default='pending'
    )

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user} booking for {self.experience}"