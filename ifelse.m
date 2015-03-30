function res = ifelse(cond, resTrue, resFalse)
%This function is a shortcut for simple if conditions
%There are two possible uses:
%	1) Assigning a value to variable, depending on the condition result
%	   Example:   A = ifelse(B, C, D);
%	   will execute A=C if B is true and A=D if B is false
%	   if B is a matrix, C&D must be scalars or the same size of B
%
%	2) Running an expression using "eval"
%	   Example:   ifelse(B, 'A=C;', 'D=E;');
%	   will execute A=C if B is true and D=E if B is false
%	   this option will run if there are no output arguments AND the expression
%	   is a string.
%
% Created by: Yanai Ankri, 30 August 2010
%

if nargout>0 || ~ischar(resTrue) || ~ischar(resFalse)
	if numel(cond)>1
		res = zeros(size(cond));flag = 0;
		if (numel(resTrue)==1) || (isequal(size(cond),size(resTrue)))
			res = res + resTrue.*cond;
			flag = flag+1;
		end
		if (numel(resFalse)==1) || (isequal(size(cond),size(resFalse)))
			res = res + resFalse.*(~cond);
			flag = flag+1;
		end
		if flag<2
			error('error in condition and result sizes !');
		end
	else
		if cond
			res = resTrue;
		else
			res = resFalse;
		end
	end
else
	if cond
		evalin('caller', resTrue);
	else
		evalin('caller', resFalse);
	end
end

