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
                sh '''
                # Download docker-compose if not found
                if ! command -v docker-compose &> /dev/null; then
                    curl -SL https://github.com/docker/compose/releases/download/v2.29.2/docker-compose-linux-x86_64 -o docker-compose
                    chmod +x docker-compose
                    ./docker-compose build
                else
                    docker-compose build
                fi
                '''
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
                sh '''
                if [ -f "./docker-compose" ]; then
                    ./docker-compose up -d
                else
                    docker-compose up -d
                fi
                '''
            }
        }
    }
}
