from django.shortcuts import render, get_object_or_404
from rest_framework.decorators import api_view
from rest_framework.response import Response

from .models import Experience
from .serializers import ExperienceSerializer


def experience_detail(request, id):
    experience = get_object_or_404(Experience, id=id)
    reviews = experience.reviews.select_related('user').all()

    return render(request, "experiences/experience_detail.html", {
        "experience": experience,
        "reviews": reviews,
    })


@api_view(['GET'])
def experience_list_api(request):
    experiences = Experience.objects.filter(is_active=True)
    serializer = ExperienceSerializer(experiences, many=True)
    return Response(serializer.data)