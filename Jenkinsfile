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
    stage ('Create Image') {
      steps {
         sh 'docker build . -t tomcatsample'
      }
    }
    stage ('Create container') {
      steps {
        sh 'docker run -it --name cont1 -d -p 8081:8080 tomcatsample
      }
    }  
  }
}
    
