function calculatePredictions( model, Xunknown, knownResult )

    predictions = svmPredict(model, Xunknown);
    classification = mean(double(predictions));

    fprintf('Predicted classification of unkown input vector1: %f\n', classification);
    if classification == knownResult
        display('This classification is CORRECT');
    else
        display('This classification is INCORRECT');
    end

end

