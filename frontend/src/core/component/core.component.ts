import { Component,Injector, OnInit, OnDestroy } from '@angular/core';
import { ActivatedRoute, Router, Resolve } from '@angular/router';
import { Subscription } from 'rxjs';

export abstract class CoreComponent implements OnInit, OnDestroy {

  private routerSubscriber: Subscription;

  constructor(protected activatedRoute: ActivatedRoute) {
  }

  ngOnInit() {
    console.log('ACTIVATED', this.activatedRoute.data);
    this.routerSubscriber = this.activatedRoute.data.subscribe((content) => {
      console.log('ROUTE', content);
      this.resolveData(content.data);
    });
  }

  protected abstract resolveData(content:any);
  
  ngOnDestroy(): void {
    this.routerSubscriber.unsubscribe();
  }

}
