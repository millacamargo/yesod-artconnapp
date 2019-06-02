import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { Observable } from 'rxjs/Observable';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'obras',
  templateUrl: 'obras.html',
})
export class Obras {
  data: Observable<any>;

  constructor(public navCtrl: NavController, public http: HttpClient) {
  
    
  }
  
  async getData() {
    var url = 'https://app-arte-camilacamargo98.c9users.io/obras';
    this.data = this.http.get(url);
    this.data.subscribe(data =>{
      console.log(data);
    });
  }
 

}

