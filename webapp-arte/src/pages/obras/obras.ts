import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { RestProvider } from '../../providers/rest/rest';

@Component({
  selector: 'obras',
  templateUrl: 'obras.html',
})
export class Obras {
  
  obras: any = [];

  constructor(public navCtrl: NavController, public restProvider: RestProvider) {
   this.getArt();
    
  }
  
  getArt() {
    this.restProvider.getArt()
    .then(data => {
      this.obras = data.obras;
      console.log(this.obras);
    });
  }
 

}

