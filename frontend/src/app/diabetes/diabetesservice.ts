import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { take } from 'rxjs/operators';
import { Diabetes } from './diabetes';

@Injectable({
  providedIn: 'root'
})
export class DiabetesService {

  private url = environment.host + 'predict-diabetes';

  constructor(private http: HttpClient) { }

  public predict(diabetes: Diabetes): Observable<Diabetes> {
    var config = {
        headers: { 'Authorization': 'Basic X1NZU1RFTTpTWVM=' }
    };
    return this.http.post<Diabetes>(this.url, diabetes, config).pipe(take(1));
  }

}
