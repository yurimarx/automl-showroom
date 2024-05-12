import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { take } from 'rxjs/operators';
import { Kidney } from './kidney';

@Injectable({
  providedIn: 'root'
})
export class KidneyService {

  private url = environment.host + 'predict-kidney-disease';

  constructor(private http: HttpClient) { }

  public predict(kidney: Kidney): Observable<Kidney> {
    var config = {
        headers: { 'Authorization': 'Basic X1NZU1RFTTpTWVM=' }
    };
    return this.http.post<Kidney>(this.url, kidney, config).pipe(take(1));
  }

}
