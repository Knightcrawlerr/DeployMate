from django.shortcuts import render, redirect
from .models import Deployment
from .forms import DeploymentForm

def index(request):
    deployments = Deployment.objects.all().order_by('-triggered_at')
    return render(request, 'dashboard/home.html', {'deployments': deployments})

def trigger_deployment(request):
    if request.method == 'POST':
        form = DeploymentForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('home')
    else:
        form = DeploymentForm()
    return render(request, 'dashboard/trigger.html', {'form': form})

