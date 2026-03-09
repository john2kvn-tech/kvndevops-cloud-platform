pipeline {
    agent any

    environment {
        PROJECT_ID = 'kvn-aia-mini-platform'
        REGION = 'us-central1'
        SERVICE = 'kvn-demo-app'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Deploy to Cloud Run') {
            steps {
                sh '''
                  gcloud run deploy $SERVICE \
                    --source ./demo-app \
                    --region $REGION \
                    --project $PROJECT_ID \
                    --no-allow-unauthenticated \
                    --port 8080
                '''
            }
        }
    }
}