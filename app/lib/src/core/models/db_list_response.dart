class DbListResponse<T> {
  final List<T> results;
  final int status;
  final int count;
  final int page;
  final int limit;

  const DbListResponse({
    required this.results,
    required this.status,
    required this.count,
    required this.page,
    required this.limit,
  });

  bool get canLoadMore {
    return page * limit < count;
  }

  @override
  String toString() {
    return {
      'page': page,
      'status': status,
      'count': count,
      'limit': limit,
      'results': results,
      'canLoadMore': canLoadMore,
    }.toString();
  }
}
