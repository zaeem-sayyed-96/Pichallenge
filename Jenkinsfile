pipeline {
    agent any

    environment {
        // Repository in the format: owner/repository
        GITHUB_REPO = 'zaeem-sayyed-96/Pichallenge'
        BRANCH = 'main'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Check out the code from GitHub
                checkout scm
            }
        }

        stage('Install bc') {
            steps {
                // Install bc (Debian/Ubuntu systems)
                sh 'sudo apt-get update && sudo apt-get install -y bc'
            }
        }

        stage('Run Algorithm') {
            steps {
                // Make sure the algorithm script is executable and run it
                sh 'chmod +x algorithm.sh && ./algorithm.sh'
            }
        }

        stage('Update README') {
            steps {
                script {
                    // Capture build status: SUCCESS or FAILURE
                    def buildStatus = currentBuild.currentResult
                    def badge = (buildStatus == 'SUCCESS') ? 
                        "![Build Status](https://img.shields.io/badge/build-success-brightgreen)" :
                        "![Build Status](https://img.shields.io/badge/build-failure-red)"

                    // Update the README file by replacing the existing build status badge line.
                    // Ensure your README.md already contains a line starting with "![Build Status]("
                    sh """
                    sed -i 's|!\\[Build Status\\](.*)|$badge|' README.md
                    git config --global user.email "jenkins@yourdomain.com"
                    git config --global user.name "Jenkins CI"
                    git add README.md
                    git commit -m "Update build status [ci skip]" || echo "No changes to commit"
                    git push https://zaeem-sayyed-96:${GITHUB_TOKEN}@github.com/${GITHUB_REPO}.git ${BRANCH}
                    """
                }
            }
        }
    }
}
