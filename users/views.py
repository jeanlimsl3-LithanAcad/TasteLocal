from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.http import Http404, HttpResponseForbidden
from django.shortcuts import render, redirect, get_object_or_404

from experiences.models import Experience
from bookings.models import Booking


def home(request):
    return render(request, "home.html")


def login_view(request):
    if request.user.is_authenticated:
        return redirect('home')

    error_message = None
    next_url = request.GET.get('next') or request.POST.get('next')

    if next_url in [None, '', 'None']:
        next_url = None

    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            return redirect(next_url if next_url else 'home')
        else:
            error_message = "Invalid username or password."

    return render(request, "login.html", {
        "error_message": error_message,
        "next": next_url,
    })


def register_view(request):
    if request.user.is_authenticated:
        return redirect('home')

    error_message = None

    if request.method == 'POST':
        username = request.POST.get('username')
        email = request.POST.get('email')
        password = request.POST.get('password')
        confirm_password = request.POST.get('confirm_password')

        if password != confirm_password:
            error_message = "Passwords do not match."
        elif User.objects.filter(username=username).exists():
            error_message = "Username already exists."
        elif User.objects.filter(email=email).exists():
            error_message = "Email is already registered."
        else:
            user = User.objects.create_user(
                username=username,
                email=email,
                password=password
            )
            login(request, user)
            return redirect('home')

    return render(request, "register.html", {
        "error_message": error_message,
    })

def discovery(request):
    experiences = Experience.objects.filter(is_active=True)

    keyword = request.GET.get('keyword', '').strip()
    category = request.GET.get('category', '').strip()
    location = request.GET.get('location', '').strip()

    if keyword:
        experiences = experiences.filter(title__icontains=keyword)

    if category:
        experiences = experiences.filter(category=category)

    if location:
        experiences = experiences.filter(location__icontains=location)

    context = {
        "experiences": experiences,
        "selected_keyword": keyword,
        "selected_category": category,
        "selected_location": location,
        "category_choices": Experience.CATEGORY_CHOICES,
    }

    return render(request, "discovery.html", context)


def vendors(request):
    experiences = Experience.objects.filter(is_active=True).order_by('-created_at')
    return render(request, "vendors.html", {
        "experiences": experiences,
    })


def booking(request):
    # Old static booking page is no longer used.
    # Keep this safe redirect so users always use the correct booking flow.
    return redirect('discover')


@login_required(login_url='/login/')
def vendor_dashboard(request):
    if not request.user.is_staff:
        return HttpResponseForbidden("You are not authorized to access the vendor dashboard.")

    vendor_experiences = Experience.objects.filter(
        vendor=request.user
    ).order_by('-created_at')

    vendor_bookings = Booking.objects.filter(
        experience__vendor=request.user
    ).select_related('experience', 'user').order_by('-created_at')

    return render(request, "vendor_dashboard.html", {
        "vendor_experiences": vendor_experiences,
        "vendor_bookings": vendor_bookings,
    })


def map_view(request):
    experiences = Experience.objects.filter(is_active=True)

    coordinate_map = {
        "Katong, Singapore": {"lat": 1.3054, "lng": 103.9050},
        "Maxwell Food Centre, Singapore": {"lat": 1.2803, "lng": 103.8446},
        "Lau Pa Sat, Singapore": {"lat": 1.2806, "lng": 103.8503},
        "East Coast, Singapore": {"lat": 1.3009, "lng": 103.9122},
        "Crawford Lane, Singapore": {"lat": 1.3073, "lng": 103.8616},
        "Newton, Singapore": {"lat": 1.3119, "lng": 103.8395},
        "Bugis, Singapore": {"lat": 1.3009, "lng": 103.8558},
        "Far East Square, Singapore": {"lat": 1.2820, "lng": 103.8487},
        "Chinatown": {"lat": 1.2838, "lng": 103.8448},
        "Katong": {"lat": 1.3054, "lng": 103.9050},
        "Maxwell Food Centre": {"lat": 1.2803, "lng": 103.8446},
        "Lau Pa Sat": {"lat": 1.2806, "lng": 103.8503},
        "East Coast": {"lat": 1.3009, "lng": 103.9122},
        "Crawford Lane": {"lat": 1.3073, "lng": 103.8616},
        "Newton": {"lat": 1.3119, "lng": 103.8395},
        "Bugis": {"lat": 1.3009, "lng": 103.8558},
        "Far East Square": {"lat": 1.2820, "lng": 103.8487},
    }

    map_experiences = []

    for exp in experiences:
        coords = coordinate_map.get(exp.location)
        if coords:
            map_experiences.append({
                "title": exp.title,
                "location": exp.location,
                "price": str(exp.price),
                "category": exp.get_category_display(),
                "lat": coords["lat"],
                "lng": coords["lng"],
            })

    return render(request, "map.html", {
        "map_experiences": map_experiences,
    })


def itinerary(request):
    # If your main urls.py already includes itineraries.urls,
    # this legacy view will no longer be used.
    return render(request, "itinerary.html")


def vendor_page(request, id):
    experience = get_object_or_404(Experience, id=id, is_active=True)
    reviews = experience.reviews.select_related('user').all()

    return render(request, "vendor.html", {
        "experience": experience,
        "reviews": reviews,
    })
    
def api_demo(request):
    return render(request, "api_demo.html")    