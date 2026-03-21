from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import LogoutView

from users.views import (
    home,
    login_view,
    register_view,
    discovery,
    vendors,
    vendor_page,
    booking,
    vendor_dashboard,
    map_view,
    itinerary,
)

urlpatterns = [
    path('admin/', admin.site.urls),

    path('', home, name='home'),
    path('login/', login_view, name='login'),
    path('register/', register_view, name='register'),
    path('logout/', LogoutView.as_view(next_page='home'), name='logout'),

    path('discover/', discovery, name='discover'),
    path('vendors/', vendors, name='vendors'),
    path('vendor/<int:id>/', vendor_page, name='vendor'),
    path('booking/', booking, name='booking'),
    path('vendor-dashboard/', vendor_dashboard, name='vendor_dashboard'),
    path('map/', map_view, name='map'),
    path('itinerary/', itinerary, name='itinerary'),

    path('experiences/', include('experiences.urls')),
    path('bookings/', include('bookings.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)