from django.shortcuts import render, get_object_or_404
from .models import Experience


def experience_detail(request, id):
    experience = get_object_or_404(Experience, id=id)

    return render(
        request,
        "experiences/experience_detail.html",
        {"experience": experience}
    )