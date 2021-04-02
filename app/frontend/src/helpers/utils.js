export {
    mergeDeep,
};

function mergeDeep(target, source, isMergingArrays = false) {
    target = ((obj) => {
        let cloneObj;
        try {
            cloneObj = JSON.parse(JSON.stringify(obj));
        } catch (err) {
            cloneObj = Object.assign({}, obj);
        }
        return cloneObj;
    })(target);

    const isObject = (obj) => obj && typeof obj === "object";

    if (!isObject(target) || !isObject(source))
        return source;

    Object.keys(source).forEach(key => {
        const targetValue = target[key];
        const sourceValue = source[key];

        if (Array.isArray(targetValue) && Array.isArray(sourceValue))
            if (isMergingArrays) {
                target[key] = targetValue.map((x, i) => sourceValue.length <= i ?
                    x :
                    mergeDeep(x, sourceValue[i], isMergingArrays));
                if (sourceValue.length > targetValue.length)
                    target[key] = target[key].concat(sourceValue.slice(targetValue.length));
            } else {
                target[key] = targetValue.concat(sourceValue);
            }
        else if (isObject(targetValue) && isObject(sourceValue))
            target[key] = mergeDeep(Object.assign({}, targetValue), sourceValue, isMergingArrays);
        else
            target[key] = sourceValue;
    });

    return target;
}
