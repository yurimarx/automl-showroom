import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { take } from 'rxjs/operators';
import { Maternal } from './maternal';

@Injectable({
  providedIn: 'root'
})
export class MaternalService {

  private url = environment.host + 'predict-maternal-risk';

  constructor(private http: HttpClient) { }

  public predict(diabetes: Maternal): Observable<Maternal> {
    var config = {
        headers: { 'Authorization': 'Basic X1NZU1RFTTpTWVM=' }
    };
    return this.http.post<Maternal>(this.url, diabetes, config).pipe(take(1));
  }

}
