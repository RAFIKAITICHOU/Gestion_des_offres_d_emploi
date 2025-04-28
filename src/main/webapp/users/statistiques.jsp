<%-- 
    Document   : statistiques
    Created on : 28 avr. 2025, 15:40:28
    Author     : ichou
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Statistiques des Offres</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <h2 class="mb-4">Statistiques : Offres par entreprise</h2>

            <div class="card p-4 shadow-sm">
                <canvas id="offreChart" height="100"></canvas>
            </div>
        </div>

        <script>
            fetch('StatistiquesController')
                    .then(response => response.json())
                    .then(data => {
                        const labels = Object.keys(data);
                        const values = Object.values(data);

                        new Chart(document.getElementById('offreChart'), {
                            type: 'bar',
                            data: {
                                labels: labels,
                                datasets: [{
                                        label: 'Nombre d’offres',
                                        data: values,
                                        backgroundColor: 'rgba(54, 162, 235, 0.6)',
                                        borderColor: 'rgba(54, 162, 235, 1)',
                                        borderWidth: 1
                                    }]
                            },
                            options: {
                                responsive: true,
                                scales: {
                                    y: {
                                        beginAtZero: true,
                                        precision: 0
                                    }
                                }
                            }
                        });
                    });
        </script>
    </body>
</html>

