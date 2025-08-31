import { useQuery } from '@tanstack/react-query';
import { getQueryKey, QueryGroup, QueryType } from '../keys';
import { apiClient } from '@/lib/api-client';

type Response = {
  isHealthy: boolean;
};

export const useHealthCheck = () => {
  return useQuery({
    queryKey: getQueryKey({
      group: QueryGroup.HEALTH_CHECK,
      type: QueryType.ONE,
      key: '',
    }),
    queryFn: async () => {
      return await apiClient.get<Response>('/');
    },
  });
};
