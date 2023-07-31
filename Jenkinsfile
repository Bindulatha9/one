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
        input message: "Approve to deploy"
        build job: 'Deploy_to_test'
      }
    }
  }
}
    
