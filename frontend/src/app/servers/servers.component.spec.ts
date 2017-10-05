import {async, ComponentFixture, TestBed, fakeAsync, tick, inject, getTestBed} from '@angular/core/testing';

import {ServersComponent} from './servers.component';
import {RouterTestingModule} from "@angular/router/testing";
import {ReactiveFormsModule} from "@angular/forms";
import {ServerListComponent} from "./server-list/server-list.component";
import {NouisliderModule} from "ng2-nouislider/src/nouislider";
import {ServersService} from "./servers.service";
import {HttpModule, XHRBackend, ResponseOptions, Http, ConnectionBackend, BaseRequestOptions} from "@angular/http";
import {ActivatedRoute, Router} from '@angular/router';
import {MockBackend, MockConnection} from '@angular/http/testing';
import {Observable} from "rxjs";

describe('ServersComponent', () => {
    let component: ServersComponent;
    let fixture: ComponentFixture<ServersComponent>;
    let testBed: TestBed;
    let mockBackend: MockBackend;
    let result: any;
    let service: ServersService;

    const mockResponse = {
        data: {
            data: {
                form: {
                    hddType: [{id: 101, name: "SATA2"}],
                    hdds: [{id: 104, name: 120, sizeType: "GB", description: "SSD"}],
                    locations: [{id: 101, name: "Amsterdam", initials: "AMS", code: "01"}],
                    rams: [{id: 107, name: 8, sizeType: "GB", description: "DDR3"}]
                },
                list: [{
                    "model": "Dell R210Intel",
                    "modelType": "Xeon X3440",
                    "hddQuantity": 2,
                    "price": "49.99",
                    "hddId": 101,
                    "hddSizeType": "TB",
                    "hddSize": 2000,
                    "totalHddSize": 4000,
                    "storage": 4,
                    "hddTypeId": 101,
                    "hddType": "SATA2",
                    "hddFull": "2x2000",
                    "ramFull": "16GB",
                    "ramId": 101,
                    "ramType": "DDR3",
                    "ramSize": 16,
                    "locationId": 101,
                    "locationInitials": "AMS",
                    "locationCode": "01",
                    "locationName": "Amsterdam",
                    "locationFull": "AMS-01"
                }]
            }
        }
    }

    beforeEach(async(() => {
        TestBed.configureTestingModule({
            declarations: [ServersComponent, ServerListComponent],
            imports: [
                RouterTestingModule,
                ReactiveFormsModule,
                NouisliderModule,
                HttpModule
            ],
            providers: [
                ServersService,
                BaseRequestOptions,
                MockBackend,
                {
                    provide: ActivatedRoute,
                    useValue: {
                        data: Observable.of(mockResponse)
                    }
                },
                {
                    provide: Http,
                    useFactory: (backend: ConnectionBackend, defaultOptions: BaseRequestOptions) => {
                        return new Http(backend, defaultOptions);
                    },
                    deps: [MockBackend, BaseRequestOptions]
                }
            ]
        }).compileComponents();

    }));

    beforeEach(() => {
        fixture = TestBed.createComponent(ServersComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should be created', () => {
        expect(component).toBeTruthy();
    });

    it('should have the server list element', () => {
        let serverList = fixture.nativeElement.getElementsByTagName('app-server-list');
        expect(serverList.length).toBe(1);
    });

    it('should assign data when route is resolved', async(inject([Router], (route) => {
        fixture.whenStable().then(() => {
            expect(component.listData).toEqual(mockResponse.data.data.list);
            expect(component.formData).toEqual(mockResponse.data.data.form);
        })
    })));
});
