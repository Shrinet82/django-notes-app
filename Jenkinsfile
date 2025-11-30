pipeline {
    agent { label "007" }

    stages {
        stage("Code") {
            steps {
                echo "This is the code stage"
                // Correct syntax for git checkout
                git url: "https://github.com/Shrinet82/django-notes-app.git", branch: "main"
                echo "The code is cloned"
            }
        }

        stage("Build") {
            steps {
                echo "This is the Build stage"
                sh "docker-compose build"
            }
        }

        stage("Test") {
            steps {
                echo "This is the Test stage"
            }
        }

        stage("Deploy") {
            steps {
                echo "This is the Deploy stage"
                sh "docker-compose up -d"
            }
        }
    }
}
