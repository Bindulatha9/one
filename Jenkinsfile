pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'mvn clean package'
      }
      post {
        success {
          echo "Now Archiving the Artifacts...."
          archiveArtifacts artifacts: '**/*.war'
        }
      }
    }  
    stage ('Deploy') {
      steps {
        build job: 'Deploy_to_test'
      }
    }
  }
}
    
