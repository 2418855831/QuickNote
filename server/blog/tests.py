import json
import os
from urllib import parse

from django.test import TestCase, Client
from django.urls import reverse
from django.conf import settings

from .models import Blog
