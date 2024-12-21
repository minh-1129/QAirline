export const getFromSessionStorage = <T>(key: string, defaultValue: T): T => {
    const item = sessionStorage.getItem(key);
    return item ? JSON.parse(item) : defaultValue;
  };