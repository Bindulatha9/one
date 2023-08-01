pipeline {
  agent any
  parameters{
    string(name:'imagename',description: 'Enter image name: ')
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
         sh 'docker build -t $imagename .'
      }
    }
    stage ('Create container') {
      steps {
        sh 'docker run -it --name $name -d -p $port:8080 $imagename'
      }
    }  
  }
}
    
