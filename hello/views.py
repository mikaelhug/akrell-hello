import os
import socket

from django.contrib.auth.models import User
from django.http import HttpResponse, JsonResponse


def index(request):
    return JsonResponse({
        "app": "akrell-hello",
        "message": "Hello from Kubit",
        "environment": os.environ.get("APP_ENV", "unknown"),
        "version": os.environ.get("APP_VERSION", "dev"),
        "pod": socket.gethostname(),
        "users": User.objects.count(),
    })


def healthz(request):
    return HttpResponse("ok", content_type="text/plain")
