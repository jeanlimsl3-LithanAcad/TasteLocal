from django.db import models
from django.contrib.auth import get_user_model
from experiences.models import Experience

User = get_user_model()


class ItineraryItem(models.Model):
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='itinerary_items'
    )
    experience = models.ForeignKey(
        Experience,
        on_delete=models.CASCADE,
        related_name='itinerary_items'
    )
    added_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-added_at']
        unique_together = ('user', 'experience')

    def __str__(self):
        return f"{self.user.username} - {self.experience.title}"