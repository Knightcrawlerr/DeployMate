from django import forms
from .models import Deployment

class DeploymentForm(forms.ModelForm):
    class Meta:
        model = Deployment
        fields = ['name', 'version', 'status']

