import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

/*
  Generated class for the RestProvider provider.

  See https://angular.io/guide/dependency-injection for more info on providers
  and Angular DI.
*/
@Injectable()
export class RestProvider {

apiUrl = 'https://app-arte-camilacamargo98.c9users.io';


  constructor(public http: HttpClient) {
  }
  
  getArt() {
return new Promise(resolve => {
  this.http.get(this.apiUrl+'/obras').subscribe(data => {
  resolve(data);
  }, err => {
     console.log(err);
   });
  });
}
  
saveArt(data) {
  return new Promise((resolve, reject) => {
  this.http.post(this.apiUrl+'/obra', JSON.stringify(data)).subscribe(res => {
  resolve(res);
 }, (err) => {
 reject(err);
  });
  });
}
 
deleteArt(obra) {
return new Promise(resolve => {
  this.http.delete(this.apiUrl+'/obra/'+ obra.id).subscribe(data => {
  resolve(data);
  }, err => {
     console.log(err);
   });
  });
}

updateArt(obra) {
  return new Promise((resolve, reject) => {
  this.http.put(this.apiUrl+'/obra/'+ obra.id, JSON.stringify(obra)).subscribe(res => {
  resolve(res);
 }, (err) => {
 reject(err);
  });
  });
}

}




