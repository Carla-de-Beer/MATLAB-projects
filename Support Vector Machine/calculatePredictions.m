function misclassified = calculatePredictions( model, Xunknown, knownResult )
    % Calculate and print the prediction results.

    predictions = svmPredict(model, Xunknown);
    classification = mean(double(predictions));
    misclassified = 0;

    fprintf('Predicted classification of unkown input vector1: %f\n', classification);
    if classification == knownResult
        display('This classification is CORRECT');
    else
        misclassified = misclassified + 1;
        display('This classification is INCORRECT');
    end
end

