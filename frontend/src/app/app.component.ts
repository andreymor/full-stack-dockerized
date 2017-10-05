import {Component, OnDestroy, OnInit} from '@angular/core';
import {Subscription} from "rxjs/Subscription";
import {Event, NavigationCancel, NavigationEnd, NavigationError, NavigationStart, Router} from "@angular/router";

@Component({
    selector: 'app-root',
    templateUrl: './app.component.html'
})
export class AppComponent implements OnInit, OnDestroy {

    loading: boolean = false;

    routeSubscription: Subscription;

    constructor(protected router: Router) {

    }

    ngOnInit(): void {

        this.routeSubscription = this.router.events.subscribe((event: Event) => {
            if (event instanceof NavigationStart) {
                setTimeout(() =>
                    this.loading = true, 0
                );
            }
            if (event instanceof NavigationEnd) {
                setTimeout(() =>
                    this.loading = false, 0
                );
            }

            if (event instanceof NavigationCancel) {
                setTimeout(() =>
                    this.loading = false, 0
                );
            }
            if (event instanceof NavigationError) {
                setTimeout(() =>
                    this.loading = false, 0
                );
            }
        });

    }

    ngOnDestroy(): void {
        this.routeSubscription.unsubscribe();
    }

}
