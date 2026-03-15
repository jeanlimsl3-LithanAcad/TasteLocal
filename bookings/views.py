from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect, get_object_or_404

from experiences.models import Experience
from .models import Booking
from .forms import BookingForm


@login_required(login_url='/login/')
def create_booking(request, experience_id):
    experience = get_object_or_404(Experience, id=experience_id)

    if request.method == 'POST':
        form = BookingForm(request.POST)
        if form.is_valid():
            booking = form.save(commit=False)
            booking.user = request.user
            booking.experience = experience
            booking.status = 'pending'
            booking.save()

            return redirect('booking_success', booking_id=booking.id)
    else:
        form = BookingForm()

    return render(request, 'bookings/create_booking.html', {
        'form': form,
        'experience': experience,
    })


@login_required(login_url='/login/')
def booking_success(request, booking_id):
    booking = get_object_or_404(
        Booking.objects.select_related('experience'),
        id=booking_id,
        user=request.user
    )

    return render(request, 'bookings/booking_success.html', {
        'booking': booking,
    })


@login_required(login_url='/login/')
def my_bookings(request):
    bookings = (
        Booking.objects.filter(user=request.user)
        .select_related('experience')
        .order_by('-created_at')
    )

    return render(request, 'bookings/my_bookings.html', {
        'bookings': bookings,
    })