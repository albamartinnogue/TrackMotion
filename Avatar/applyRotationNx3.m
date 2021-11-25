function modelRotated = applyRotationNx3(model,...
    displacement,R)
modelRotated = R*(model-repmat(displacement,size(model,1),1))';
modelRotated = modelRotated' + repmat(displacement,size(model,1),1);
end

