from django.db import models
from django.contrib.auth import get_user_model

User = get_user_model()


class Experience(models.Model):
    """Represents a food experience created by a vendor."""

    CATEGORY_CHOICES = [
        ('hawker', 'Hawker'),
        ('restaurant', 'Restaurant'),
        ('cafe', 'Cafe'),
        ('tour', 'Food Tour'),
        ('workshop', 'Cooking Workshop'),
    ]

    title = models.CharField(max_length=200)
    description = models.TextField()

    category = models.CharField(
        max_length=20,
        choices=CATEGORY_CHOICES
    )

    location = models.CharField(max_length=255)

    price = models.DecimalField(
        max_digits=8,
        decimal_places=2
    )

    capacity = models.PositiveIntegerField(
        help_text="Maximum number of participants"
    )

    # Optional image for frontend display
    image = models.ImageField(
        upload_to='experiences/',
        blank=True,
        null=True
    )

    vendor = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='experiences'
    )

    is_active = models.BooleanField(
        default=True,
        help_text="Uncheck to hide this experience from listings"
    )

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['-created_at']
        verbose_name = "Experience"
        verbose_name_plural = "Experiences"

    def __str__(self):
        return f"{self.title} - {self.location}"