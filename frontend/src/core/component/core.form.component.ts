import {Injector, OnInit, OnDestroy, Output, EventEmitter} from '@angular/core';
import {CoreItemComponent} from "./core.item.component";
import {CoreFormGroup} from "../form/core.form-group";
import {ActivatedRoute} from "@angular/router";
import {CoreHttpService} from "../http/core.http.service";
import {Query} from "../http/core.http.query.model";


/**
 * componente de base para edição de um registro qualquer.
 * 
 * Para adicionar validação implemente a trait Validable 
 */
export abstract class CoreFormComponent extends CoreItemComponent {

    formData: any;

    submitData: any;

    form: CoreFormGroup = new CoreFormGroup({});

    @Output()
    onSuccess: EventEmitter<any> = new EventEmitter();

    constructor(protected activatedRoute: ActivatedRoute, protected httpService: CoreHttpService) {
        super(activatedRoute);
    }

    ngOnInit() {
        super.ngOnInit();
        this.form.addControl('formInput', new CoreFormGroup({}));
        this.form.submitted = false;
    }

    /**
     * @desc Resolve os dados de consulta para a rota
     * @param info
     */
    resolveData(info: any) {
        this.formData = info;
    }

    prepareDataToSubmit(): void {
        this.submitData = Object.assign({}, this.form.get('formInput').getRawValue());
    }

    /**
     *
     * @param item
     */
    prepare(item?: any): Promise<any> {
        return Promise.resolve(this.formData);
    }

    /**
     * submit do formulário
     */
    submit() {
        this.form.submitted = true;
        this.onSubmit();
    }

    /**
     * Método usado para construir a consulta que será usado para o fetch dos dados
     */
    abstract onSubmit(): void;
}
