from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect, get_object_or_404

from experiences.models import Experience
from .models import ItineraryItem


@login_required(login_url='/login/')
def add_to_itinerary(request, experience_id):
    experience = get_object_or_404(Experience, id=experience_id)

    ItineraryItem.objects.get_or_create(
        user=request.user,
        experience=experience
    )

    return redirect('itinerary')


@login_required(login_url='/login/')
def itinerary_list(request):
    itinerary_items = ItineraryItem.objects.filter(
        user=request.user
    ).select_related('experience')

    return render(request, 'itinerary.html', {
        'itinerary_items': itinerary_items,
    })


@login_required(login_url='/login/')
def remove_from_itinerary(request, item_id):
    itinerary_item = get_object_or_404(
        ItineraryItem,
        id=item_id,
        user=request.user
    )

    itinerary_item.delete()
    return redirect('itinerary')