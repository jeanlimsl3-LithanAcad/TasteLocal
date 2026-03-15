from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.http import Http404
from django.shortcuts import render, redirect

from experiences.models import Experience


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
    return render(request, "discovery.html", {"experiences": experiences})


def vendors(request):
    return render(request, "vendors.html")


def booking(request):
    return render(request, "booking.html")


def vendor_dashboard(request):
    return render(request, "vendor_dashboard.html")


def map_view(request):
    return render(request, "map.html")


def itinerary(request):
    return render(request, "itinerary.html")


def vendor_page(request, id):
    vendors_data = {
        1: {
            "title": "328 Katong Laksa",
            "host": "328 Katong Laksa",
            "rating": "4.9 ★",
            "location": "Katong, Singapore",
            "price": "SGD 8 – 12",
            "image": "laksa.jpg",
            "map": "https://www.google.com/maps?q=328+Katong+Laksa+Singapore&output=embed",
            "map_link": "https://www.google.com/maps?q=328+Katong+Laksa+Singapore",
        },
        2: {
            "title": "Tian Tian Hainanese Chicken Rice",
            "host": "Tian Tian Chicken Rice",
            "rating": "4.8 ★",
            "location": "Maxwell Food Centre, Singapore",
            "price": "SGD 6 – 10",
            "image": "chicken_rice.jpg",
            "map": "https://www.google.com/maps?q=Tian+Tian+Chicken+Rice+Maxwell+Singapore&output=embed",
            "map_link": "https://www.google.com/maps?q=Tian+Tian+Chicken+Rice+Maxwell+Singapore",
        },
        3: {
            "title": "Lau Pa Sat Satay Street",
            "host": "Lau Pa Sat",
            "rating": "4.7 ★",
            "location": "Lau Pa Sat, Singapore",
            "price": "SGD 10 – 20",
            "image": "satay.jpg",
            "map": "https://www.google.com/maps?q=Lau+Pa+Sat+Singapore&output=embed",
            "map_link": "https://www.google.com/maps?q=Lau+Pa+Sat+Singapore",
        },
        4: {
            "title": "Jumbo Seafood Chilli Crab",
            "host": "Jumbo Seafood",
            "rating": "4.8 ★",
            "location": "East Coast, Singapore",
            "price": "SGD 40 – 80",
            "image": "chilli_crab.jpg",
            "map": "https://www.google.com/maps?q=Jumbo+Seafood+East+Coast+Singapore&output=embed",
            "map_link": "https://www.google.com/maps?q=Jumbo+Seafood+East+Coast+Singapore",
        },
        5: {
            "title": "Hill Street Tai Hwa Pork Noodle",
            "host": "Tai Hwa Pork Noodle",
            "rating": "4.8 ★",
            "location": "Crawford Lane, Singapore",
            "price": "SGD 6 – 12",
            "image": "noodles.jpg",
            "map": "https://www.google.com/maps?q=Hill+Street+Tai+Hwa+Pork+Noodle+Singapore&output=embed",
            "map_link": "https://www.google.com/maps?q=Hill+Street+Tai+Hwa+Pork+Noodle+Singapore",
        },
        6: {
            "title": "Newton Food Centre Hawker Experience",
            "host": "Newton Food Centre",
            "rating": "4.6 ★",
            "location": "Newton, Singapore",
            "price": "SGD 15 – 30",
            "image": "hawker.jpg",
            "map": "https://www.google.com/maps?q=Newton+Food+Centre+Singapore&output=embed",
            "map_link": "https://www.google.com/maps?q=Newton+Food+Centre+Singapore",
        },
        7: {
            "title": "Ah Chew Traditional Desserts",
            "host": "Ah Chew Desserts",
            "rating": "4.6 ★",
            "location": "Bugis, Singapore",
            "price": "SGD 5 – 10",
            "image": "dessert.jpg",
            "map": "https://www.google.com/maps?q=Ah+Chew+Desserts+Singapore&output=embed",
            "map_link": "https://www.google.com/maps?q=Ah+Chew+Desserts+Singapore",
        },
        8: {
            "title": "Ya Kun Kaya Toast Breakfast Experience",
            "host": "Ya Kun Kaya Toast",
            "rating": "4.5 ★",
            "location": "Far East Square, Singapore",
            "price": "SGD 4 – 8",
            "image": "kaya_toast.jpg",
            "map": "https://www.google.com/maps?q=Ya+Kun+Kaya+Toast+Singapore&output=embed",
            "map_link": "https://www.google.com/maps?q=Ya+Kun+Kaya+Toast+Singapore",
        },
    }

    vendor = vendors_data.get(id)

    if vendor is None:
        raise Http404("Vendor not found.")

    return render(request, "vendor.html", {"vendor": vendor})