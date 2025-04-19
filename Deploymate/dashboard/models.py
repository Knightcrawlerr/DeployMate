from django.db import models

class Deployment(models.Model):
    name = models.CharField(max_length=255)
    status = models.CharField(max_length=50, choices=[
        ('Pending', 'Pending'),
        ('In Progress', 'In Progress'),
        ('Successful', 'Successful'),
        ('Failed', 'Failed')
    ])
    version = models.CharField(max_length=50)
    triggered_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.name} - {self.status}"

