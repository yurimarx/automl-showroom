import { RouterModule } from '@angular/router';
import { NgModule } from '@angular/core';
import { AppMainComponent } from './app.main.component';
import { DiabetesComponent } from './diabetes/diabetes.component';
import { KidneyComponent } from './kidney/kidney.component';
import { MaternalComponent } from './maternal/maternal.component';
@NgModule({
    imports: [
        RouterModule.forRoot([
            {
                path: '', component: AppMainComponent,
                children: [
                    {path: 'diabetes', component: DiabetesComponent},
                    {path: 'kidney', component: KidneyComponent},
                    {path: 'maternal', component: MaternalComponent},
                ],
            },
        ], {scrollPositionRestoration: 'enabled', anchorScrolling:'enabled'})
    ],
    exports: [RouterModule]
})
export class AppRoutingModule {
}
