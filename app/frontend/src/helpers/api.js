import { mergeDeep } from './utils';
export default {
    Get,
    Post,
    Put,
    Delete,
};

const ApiURL = '/api';

function abortableFetch(request, opts) {
    const controller = new AbortController();
    const signal = controller.signal;
    return {
        abort() { return controller.abort() },
        ready() { return fetch(request, {
            ...opts,
            signal
        }).then((response) => response) }
    };
}

function Get(endpoint, params, fetchOpts = {}) {
    if(!endpoint) {
        console.error('Using $api.Get without endpoint');
        return;
    }
    let defaultOpts = {
        method: 'GET',
        headers: {
            'Accept': 'application/json',
        }
    }
    let opts = mergeDeep(defaultOpts, fetchOpts);
    if(params) {
        //console.log(params);
    }
    return abortableFetch(ApiURL + endpoint, opts);
}

function Post(endpoint, params, fetchOpts = {}) {
    if(!endpoint) {
        console.error('Using $api.Post without endpoint');
        return;
    }
    let defaultOpts = {
        method: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
        }
    }
    let opts = mergeDeep(defaultOpts, fetchOpts);
    if(params) {
        if(params.data !== undefined && opts.body === undefined) opts.body = (typeof params.data === 'object') ? JSON.stringify(params.data) : params.data;
    }
    return abortableFetch(ApiURL + endpoint, opts);
}

function Put(endpoint, params, fetchOpts = {}) {
    if(!endpoint) {
        console.error('Using $api.Put without endpoint');
        return;
    }
    let defaultOpts = {
        method: 'PUT',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
        }
    }
    let opts = mergeDeep(defaultOpts, fetchOpts);
    if(params) {
        if(params.data !== undefined && opts.body === undefined) opts.body = (typeof params.data === 'object') ? JSON.stringify(params.data) : params.data;
    }
    return abortableFetch(ApiURL + endpoint, opts);
}

function Delete(endpoint, params, fetchOpts = {}) {
    if(!endpoint) {
        console.error('Using $api.Delete without endpoint');
        return;
    }
    let defaultOpts = {
        method: 'DELETE',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
        }
    }
    let opts = mergeDeep(defaultOpts, fetchOpts);
    if(params) {
        if(params.data !== undefined && opts.body === undefined) opts.body = (typeof params.data === 'object') ? JSON.stringify(params.data) : params.data;
    }
    return abortableFetch(ApiURL + endpoint, opts);
}
