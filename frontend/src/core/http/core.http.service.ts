import {Http, Response, URLSearchParams} from '@angular/http';
import {Query} from "./core.http.query.model";
import {Injectable} from "@angular/core";

@Injectable()
export class CoreHttpService {

    protected endpoint: string;
    protected requestParams: URLSearchParams;
    protected requestOptions: any;
    private _uri: string;


    constructor(protected http: Http) {
    }

    private mountEndpoint(query: Query, unique: boolean = false) {
        this.endpoint = this.buildUriEndpoint((!unique) ? this.uri : `${this.uri}/{id}`, query.pathParams);
        this.requestParams = this.buildParams(query.queryParams);
    }

    set uri(uri: string) {
        this._uri = uri
    }

    get uri() {
        return this._uri;
    }

    /**
     *
     * @param query
     * @returns {Promise<any>}
     */
    cGet(query: Query = new Query()): Promise<any> {
        this.mountEndpoint(query);
        this.requestOptions = {
            method: 'GET',
            params: this.requestParams
        }
        return this.request();
    }

    /**
     *
     * @param query
     * @returns {Promise<any>}
     */
    get(query: Query = new Query()): Promise<any> {
        this.mountEndpoint(query, true);
        this.requestOptions = {
            method: 'GET',
            params: this.requestParams
        }
        return this.request();
    }

    /**
     *
     * @param query
     * @returns {Promise<any>}
     */
    post(query: Query = new Query()): Promise<any> {
        this.mountEndpoint(query);
        this.requestOptions = {
            method: 'POST',
            params: this.requestParams,
            body: query.data
        }
        return this.request();
    }

    /**
     *
     * @param query
     * @returns {Promise<any>}
     */
    put(query: Query = new Query()): Promise<any> {
        this.mountEndpoint(query, true);
        this.requestOptions = {
            method: 'PUT',
            params: this.requestParams,
            body: query.data
        }
        return this.request();
    }

    /**
     *
     * @param query
     * @returns {Promise<any>}
     */
    delete(query: Query = new Query()): Promise<any> {
        this.mountEndpoint(query, true);
        this.requestOptions = {
            method: 'DELETE',
            params: this.requestParams
        }
        return this.request();
    }

    protected request(): Promise<any> {
        return new Promise((resolve, reject) => {
            this.http.request(this.endpoint, this.requestOptions)
                .toPromise()
                .then((response) => {
                    resolve(response.json());
                })
                .catch((error) => {
                console.log('ERRO', error);

                });
        })
    }


    /**
     *
     * @param querystring
     * @returns {URLSearchParams}
     */
    protected buildParams(querystring: any) {
        let search: URLSearchParams = new URLSearchParams();
        if (querystring) {
            for (let param in querystring) {
                search.set(param, querystring[param]);
            }
        }
        return search;
    }

    /**
     *
     * @param uri
     * @param params
     * @returns {string}
     */
    protected buildUriEndpoint(uri: string, params: any): string {
        let url = uri;
        for (let param in params) {
            url = url.replace(new RegExp(`{${param}}`, 'g'), params[param]);
        }
        return url;
    }

}