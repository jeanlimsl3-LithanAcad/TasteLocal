from rest_framework import serializers
from .models import Experience


class ExperienceSerializer(serializers.ModelSerializer):
    category_display = serializers.CharField(source='get_category_display', read_only=True)

    class Meta:
        model = Experience
        fields = [
            'id',
            'title',
            'description',
            'location',
            'category',
            'category_display',
            'price',
            'is_active',
        ]