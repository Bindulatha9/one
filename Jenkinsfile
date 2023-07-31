pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'mvn clean package'
      }
      post {
        success {
          echo "Archiveing Artifacts"
          archiveArtifacts artifacts: '**/*.war'
        }
      }
    stage ('Deploy') {
      steps {
        build job: 'Deploy_to_test'
      }
    }
  
    
