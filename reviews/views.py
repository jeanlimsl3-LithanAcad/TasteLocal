from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect, get_object_or_404

from experiences.models import Experience
from .models import Review
from .forms import ReviewForm


@login_required(login_url='/login/')
def add_review(request, experience_id):
    experience = get_object_or_404(Experience, id=experience_id)

    existing_review = Review.objects.filter(
        user=request.user,
        experience=experience
    ).first()

    if existing_review:
        return redirect('experience_detail', id=experience.id)

    if request.method == 'POST':
        form = ReviewForm(request.POST)
        if form.is_valid():
            review = form.save(commit=False)
            review.user = request.user
            review.experience = experience
            review.save()

            return redirect('experience_detail', id=experience.id)
    else:
        form = ReviewForm()

    return render(request, 'reviews/add_review.html', {
        'form': form,
        'experience': experience,
    })