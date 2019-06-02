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
    console.log('Hello RestServiceProvider Provider');
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

}
