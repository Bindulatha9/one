pipeline {
  agent any
  parameters{
    string(name:'name',description: 'Enter Container name: ')
    string(name:'port',description: 'Enter port number: ')
  }
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
        sh 'docker run -it --name $name -d -p $port:8080 tomcatsample'
      }
    }  
  }
}
    
